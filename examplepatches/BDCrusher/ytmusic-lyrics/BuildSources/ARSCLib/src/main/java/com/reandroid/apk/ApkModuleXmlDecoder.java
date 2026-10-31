/*
 *  Copyright (C) 2022 github.com/REAndroid
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.reandroid.apk;

import com.reandroid.app.AndroidManifest;
import com.reandroid.archive.InputSource;
import com.reandroid.arsc.chunk.Overlayable;
import com.reandroid.arsc.chunk.PackageBlock;
import com.reandroid.arsc.chunk.TableBlock;
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock;
import com.reandroid.arsc.chunk.xml.ResXmlDocument;
import com.reandroid.arsc.coder.xml.XmlCoder;
import com.reandroid.arsc.list.OverlayableList;
import com.reandroid.utils.io.FileUtil;
import com.reandroid.utils.io.IOUtil;
import com.reandroid.arsc.value.*;
import com.reandroid.json.JSONObject;
import com.reandroid.xml.XMLFactory;
import com.reandroid.xml.XmlIndentingSerializer;
import org.xmlpull.v1.XmlSerializer;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;
import java.util.function.Predicate;

public class ApkModuleXmlDecoder extends ApkModuleDecoder implements Predicate<Entry> {
    private final Map<Integer, Set<ResConfig>> decodedEntries;
    private boolean keepResPath;

    public ApkModuleXmlDecoder(ApkModule apkModule){
        super(apkModule);
        this.decodedEntries = new HashMap<>();
    }
    public void setKeepResPath(boolean keepResPath){
        this.keepResPath = keepResPath;
    }
    public boolean keepResPath() {
        return keepResPath;
    }

    @Override
    void initialize(){
        super.initialize();
        validateResourceNames();
    }
    @Override
    public void decodeResourceTable(File mainDirectory) throws IOException{
        TableBlock tableBlock = getApkModule().getTableBlock();
        decodeTableBlock(mainDirectory, tableBlock);
        decodeResFiles(mainDirectory);
        decodeValues(mainDirectory, tableBlock);
        decodeOverlayable(mainDirectory, tableBlock);
    }
    private void decodeTableBlock(File mainDirectory, TableBlock tableBlock) throws IOException {
        try{
            decodePackageInfo(mainDirectory, tableBlock);
            decodePublicXml(mainDirectory, tableBlock);
            addDecodedPath(TableBlock.FILE_NAME);
        }catch (IOException exception){
            logOrThrow("Error decoding resource table", exception);
        }
    }
    private void decodePackageInfo(File mainDirectory, TableBlock tableBlock) throws IOException {
        for(PackageBlock packageBlock:tableBlock.listPackages()){
            decodePackageInfo(mainDirectory, packageBlock);
        }
    }
    private void decodePackageInfo(File mainDirectory, PackageBlock packageBlock) throws IOException {
        File packageDirectory = toPackageDirectory(mainDirectory, packageBlock);
        File packageJsonFile = new File(packageDirectory, PackageBlock.JSON_FILE_NAME);
        JSONObject jsonObject = packageBlock.toJson(false);
        jsonObject.write(packageJsonFile);
    }
    private void decodeResFiles(File mainDirectory) throws IOException{
        if(keepResPath()){
            logMessage("Res files: " + TableBlock.RES_FILES_DIRECTORY_NAME);
        }else {
            logMessage("Res files: " + TableBlock.DIRECTORY_NAME);
        }
        List<ResFile> resFileList = getApkModule().listResFiles();
        ResFileWriter resFileWriter = new ResFileWriter();
        try{
            for(ResFile resFile:resFileList){
                decodeResFile(mainDirectory, resFile, resFileWriter);
            }
        }catch (IOException | RuntimeException exception){
            resFileWriter.abort();
            throw exception;
        }
        resFileWriter.finish();
    }
    private void decodeResFile(File mainDirectory, ResFile resFile, ResFileWriter resFileWriter)
            throws IOException{
        if(resFile.isBinaryXml()){
            try{
                decodeResXml(mainDirectory, resFile, resFileWriter);
            }catch (Exception ex){
                logOrThrow("Failed to decode: "
                        + resFile.getFilePath(), ex);
            }
            return;
        }
        String path = resFile.getFilePath();
        if(path.endsWith(".xml")){
            logMessage("Ignore non bin xml: " + path);
            return;
        }
        decodeResRaw(mainDirectory, resFile, resFileWriter);
    }
    private void decodeResRaw(File mainDirectory, ResFile resFile, ResFileWriter resFileWriter)
            throws IOException {
        Entry entry = resFile.pickOne();
        PackageBlock packageBlock = entry.getPackageBlock();

        File file = toDecodeResFile(mainDirectory, resFile, packageBlock);
        InputSource inputSource = resFile.getInputSource();
        logVerbose(inputSource.getAlias());
        resFileWriter.write(file, IOUtil.readFully(inputSource.openStream()));
        if(!keepResPath()){
            addDecodedEntry(entry);
        }
        addDecodedPath(inputSource.getAlias());
    }
    private void decodeResXml(File mainDirectory, ResFile resFile, ResFileWriter resFileWriter)
            throws IOException{
        Entry entry = resFile.pickOne();
        PackageBlock packageBlock = entry.getPackageBlock();

        File file = toDecodeResFile(mainDirectory, resFile, packageBlock);
        InputSource inputSource = resFile.getInputSource();

        logVerbose(inputSource.getAlias());
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        serializeXml(packageBlock, inputSource, outputStream);
        resFileWriter.write(file, outputStream.toByteArray());

        if(!keepResPath()){
            addDecodedEntry(entry);
        }
        addDecodedPath(inputSource.getAlias());
    }
    private File toDecodeResFile(File mainDirectory, ResFile resFile, PackageBlock packageBlock){
        String path;
        File dir;
        if(keepResPath()){
            path = resFile.getInputSource().getAlias();
            dir = new File(mainDirectory, TableBlock.RES_FILES_DIRECTORY_NAME);
        }else {
            path = resFile.buildPath(PackageBlock.RES_DIRECTORY_NAME);
            dir = toPackageDirectory(mainDirectory, packageBlock);
            resFile.setFilePath(path);
        }
        path = path.replace('/', File.separatorChar);
        return new File(dir, path);
    }
    private void decodePublicXml(File mainDirectory, TableBlock tableBlock)
            throws IOException{
        for(PackageBlock packageBlock:tableBlock.listPackages()){
            decodePublicXml(mainDirectory, packageBlock);
        }
        if(tableBlock.size() == 0){
            decodeEmptyTable(mainDirectory, tableBlock);
        }
    }
    private void decodePublicXml(File mainDirectory, PackageBlock packageBlock)
            throws IOException {
        File packageDirectory = toPackageDirectory(mainDirectory, packageBlock);
        logMessage("public.xml: "
                + packageBlock.getName() + " -> " + packageDirectory.getName());
        File file = new File(packageDirectory, PackageBlock.RES_DIRECTORY_NAME);
        file = new File(file, PackageBlock.VALUES_DIRECTORY_NAME);
        file = new File(file, PackageBlock.PUBLIC_XML);
        packageBlock.serializePublicXml(file);
    }
    private void decodeEmptyTable(File mainDirectory, TableBlock tableBlock) throws IOException {
        logMessage("Decoding empty table ...");
        File packageDirectory = new File(mainDirectory, TableBlock.DIRECTORY_NAME);
        packageDirectory = new File(packageDirectory, PackageBlock.DIRECTORY_NAME_PREFIX + "1");
        logMessage("Empty public.xml: "
                + packageDirectory.getName());
        File file = new File(packageDirectory, PackageBlock.RES_DIRECTORY_NAME);
        file = new File(file, PackageBlock.VALUES_DIRECTORY_NAME);
        file = new File(file, PackageBlock.PUBLIC_XML);
        PackageBlock packageBlock = tableBlock.pickOrEmptyPackage();
        packageBlock.serializePublicXml(file);
    }
    @Override
    public void decodeAndroidManifest(File mainDirectory)
            throws IOException {
        if(containsDecodedPath(AndroidManifest.FILE_NAME)){
            return;
        }
        if(!getApkModule().hasAndroidManifest()){
            decodeEmptyAndroidManifestXml(mainDirectory);
        }else if(isExcluded(AndroidManifest.FILE_NAME)){
            decodeAndroidManifestBin(mainDirectory);
        }else {
            decodeAndroidManifestXml(mainDirectory);
        }
    }
    private void decodeEmptyAndroidManifestXml(File mainDirectory) throws IOException {
        logMessage("WARN: Missing " + AndroidManifest.FILE_NAME
                + ", could be framework apk or you are decompiling wrong apk file");
        File file = new File(mainDirectory, AndroidManifest.FILE_NAME);
        XmlSerializer serializer = XMLFactory.newSerializer(file);
        serializer.startDocument("utf-8", null);
        serializer.text("\n");
        serializer.startTag(null, AndroidManifest.EMPTY_MANIFEST_TAG);
        serializer.endTag(null, AndroidManifest.EMPTY_MANIFEST_TAG);
        serializer.endDocument();
        serializer.flush();
        IOUtil.close(serializer);
        addDecodedPath(AndroidManifest.FILE_NAME);
    }
    private void decodeAndroidManifestXml(File mainDirectory)
            throws IOException {
        AndroidManifestBlock manifestBlock = getApkModule().getAndroidManifest();
        File file = new File(mainDirectory, AndroidManifest.FILE_NAME);
        logMessage("Decoding: " + file.getName());
        PackageBlock packageBlock = manifestBlock.getPackageBlock();
        if(packageBlock == null){
            int packageId = manifestBlock.guessCurrentPackageId();
            TableBlock tableBlock = getApkModule().getTableBlock();
            packageBlock = tableBlock.pickOne(packageId);
            if(packageBlock == null){
                packageBlock = tableBlock.pickOne();
            }
        }
        serializeXml(packageBlock, manifestBlock, file);
        addDecodedPath(AndroidManifest.FILE_NAME);
    }
    private void decodeAndroidManifestBin(File mainDirectory)
            throws IOException {
        File file = new File(mainDirectory, AndroidManifest.FILE_NAME_BIN);
        logMessage("Decode manifest binary: " + file.getName());
        ApkModule apkModule = getApkModule();
        InputSource inputSource = apkModule.getManifestOriginalSource();
        if(inputSource == null){
            inputSource = apkModule.getInputSource(AndroidManifest.FILE_NAME);
        }
        inputSource.write(file);
        addDecodedPath(AndroidManifest.FILE_NAME);
    }
    private void serializeXml(PackageBlock packageBlock, ResXmlDocument document, File outFile)
            throws IOException {
        serializeXml(packageBlock, document, FileUtil.outputStream(outFile));
    }
    private void serializeXml(PackageBlock packageBlock, ResXmlDocument document, OutputStream outputStream)
            throws IOException {
        if(packageBlock != null && document.getPackageBlock() == null){
            document.setPackageBlock(packageBlock);
        }
        XmlSerializer serializer = XMLFactory.newSerializer(outputStream, document.getEncoding());
        document.serialize(serializer);
        IOUtil.close(serializer);
    }
    private void serializeXml(PackageBlock packageBlock, InputSource inputSource, OutputStream outputStream)
            throws IOException {
        ResXmlDocument document = new ResXmlDocument();
        document.readBytes(inputSource.openStream());
        document.setPackageBlock(packageBlock);
        serializeXml(packageBlock, document, outputStream);
    }
    private void addDecodedEntry(Entry entry){
        if(entry.isNull()){
            return;
        }
        int resourceId= entry.getResourceId();
        Set<ResConfig> resConfigSet = decodedEntries.get(resourceId);
        if(resConfigSet==null){
            resConfigSet=new HashSet<>();
            decodedEntries.put(resourceId, resConfigSet);
        }
        resConfigSet.add(entry.getResConfig());
    }
    private boolean containsDecodedEntry(Entry entry){
        Set<ResConfig> resConfigSet = decodedEntries.get(entry.getResourceId());
        if(resConfigSet == null){
            return false;
        }
        return resConfigSet.contains(entry.getResConfig());
    }
    private void decodeValues(File mainDirectory, TableBlock tableBlock) throws IOException {
        File resourcesDir = new File(mainDirectory, TableBlock.DIRECTORY_NAME);
        XmlCoder xmlCoder = XmlCoder.getInstance();
        xmlCoder.VALUES_XML.decodeTable(resourcesDir, tableBlock, this);
    }
    private void decodeOverlayable(File mainDirectory, TableBlock tableBlock) throws IOException {
        for (PackageBlock packageBlock : tableBlock) {
            decodeOverlayable(mainDirectory, packageBlock);
        }
    }
    private void decodeOverlayable(File mainDirectory, PackageBlock packageBlock) throws IOException {
        OverlayableList overlayableList = packageBlock.getOverlayableList();
        if(overlayableList.isEmpty()) {
            return;
        }
        logMessage("Decode: overlayable");
        File packageDirectory = toPackageDirectory(mainDirectory, packageBlock);
        File file = new File(packageDirectory, PackageBlock.RES_DIRECTORY_NAME);
        file = new File(file, PackageBlock.VALUES_DIRECTORY_NAME);
        file = new File(file, Overlayable.FILE_NAME_XML);
        XmlSerializer serializer = new XmlIndentingSerializer(XMLFactory.newSerializer(file));
        XMLFactory.setEnableIndentAttributes(serializer, false);
        overlayableList.serialize(serializer);
    }
    @Override
    public boolean test(Entry entry) {
        return containsDecodedEntry(entry);
    }

    /**
     * Writes decoded res files on background threads, as creating many small files is mostly
     * time spent waiting on the file system. The contents are decoded by the caller because
     * the table is not thread safe, so only the file writing is done in parallel.
     */
    private class ResFileWriter {
        private static final int RES_FILE_WRITE_THREADS = 2; // TODO: Use number of device cores?
        private static final int MAX_PENDING_WRITE_BYTES = 16 * 1024 * 1024;

        private final ExecutorService executor;
        private final Semaphore pendingBytes;
        private final Set<File> createdDirectories;
        private volatile File failedFile;
        private volatile IOException failure;

        ResFileWriter(){
            this.executor = Executors.newFixedThreadPool(RES_FILE_WRITE_THREADS, runnable -> {
                Thread thread = new Thread(runnable, "res-file-writer");
                thread.setDaemon(true);
                return thread;
            });
            this.pendingBytes = new Semaphore(MAX_PENDING_WRITE_BYTES);
            this.createdDirectories = new HashSet<>();
        }
        void write(File file, byte[] bytes) throws IOException {
            if(failure != null){
                return;
            }
            File dir = file.getParentFile();
            if(dir != null && createdDirectories.add(dir) && !dir.exists()){
                dir.mkdirs();
            }
            // Limits the memory used by contents waiting to be written.
            int permits = Math.min(Math.max(bytes.length, 1), MAX_PENDING_WRITE_BYTES);
            try{
                pendingBytes.acquire(permits);
            }catch (InterruptedException exception){
                Thread.currentThread().interrupt();
                throw new InterruptedIOException("Interrupted writing: " + file);
            }
            executor.execute(() -> {
                try(FileOutputStream outputStream = new FileOutputStream(file)){
                    outputStream.write(bytes);
                }catch (IOException exception){
                    synchronized (this){
                        if(failure == null){
                            failedFile = file;
                            failure = exception;
                        }
                    }
                }finally {
                    pendingBytes.release(permits);
                }
            });
        }
        void finish() throws IOException {
            executor.shutdown();
            try{
                while (!executor.awaitTermination(1, TimeUnit.MINUTES)){
                    logVerbose("Waiting for res files to be written ...");
                }
            }catch (InterruptedException exception){
                executor.shutdownNow();
                Thread.currentThread().interrupt();
                throw new InterruptedIOException("Interrupted writing res files");
            }
            IOException failure = this.failure;
            if(failure != null){
                logOrThrow("Failed to write: " + failedFile, failure);
            }
        }
        void abort(){
            executor.shutdownNow();
        }
    }
}
