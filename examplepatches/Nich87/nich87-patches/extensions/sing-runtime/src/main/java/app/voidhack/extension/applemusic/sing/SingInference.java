package app.voidhack.extension.applemusic.sing;

import ai.onnxruntime.NodeInfo;
import ai.onnxruntime.OnnxJavaType;
import ai.onnxruntime.OnnxTensor;
import ai.onnxruntime.OrtEnvironment;
import ai.onnxruntime.OrtException;
import ai.onnxruntime.OrtSession;
import ai.onnxruntime.TensorInfo;
import android.content.Context;
import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collections;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

final class SingInference implements AutoCloseable {
    private static final String TAG = "VoidhackSing";
    private static final String MODEL_NAME = "UVR_MDXNET_1_9703.onnx";
    private static final String MODEL_URL = "https://huggingface.co/Francasio/sing-android-weights-db/resolve/"
        + "988da1f91b7941690aefa892c44cb4ffe5af8f8c/" + MODEL_NAME;
    private static final String MODEL_SHA256 = "e02220e80d8253f4c2209f8924298b2b686bbdf2868b788ff5500fb9bd94aadc";
    private static final int MODEL_BYTES = 29_704_436;
    private static final int MAX_REDIRECTS = 5;
    private static final long[] SHAPE = {1, 4, MdxSpectrum.BINS, MdxSpectrum.TIME_STEPS};

    private final OrtSession session;
    private final MdxSpectrum spectrum = new MdxSpectrum();
    private final float[] features = new float[MdxSpectrum.TENSOR_SIZE];
    private final FloatBuffer inputBuffer = allocateTensorBuffer();
    private final FloatBuffer outputBuffer = allocateTensorBuffer();
    private final OnnxTensor input;
    private final OnnxTensor output;
    private final Map<String, OnnxTensor> inputs;
    private final Map<String, OnnxTensor> outputs;
    private boolean closed;

    private SingInference(OrtEnvironment environment, OrtSession session) throws IOException, OrtException {
        this.session = session;
        String inputName = tensorName(session.getInputInfo());
        String outputName = tensorName(session.getOutputInfo());
        input = OnnxTensor.createTensor(environment, inputBuffer, SHAPE);
        try {
            output = OnnxTensor.createTensor(environment, outputBuffer, SHAPE);
        } catch (OrtException | RuntimeException exception) {
            input.close();
            throw exception;
        }
        inputs = Collections.singletonMap(inputName, input);
        outputs = Collections.singletonMap(outputName, output);
    }

    static SingInference open(Context context) throws IOException, NoSuchAlgorithmException, OrtException {
        OrtEnvironment environment = OrtEnvironment.getEnvironment();
        File model = getVerifiedModel(context);
        try (OrtSession.SessionOptions options = new OrtSession.SessionOptions()) {
            options.setIntraOpNumThreads(Math.min(4, Runtime.getRuntime().availableProcessors()));
            options.setInterOpNumThreads(1);
            options.setOptimizationLevel(OrtSession.SessionOptions.OptLevel.ALL_OPT);
            OrtSession session = environment.createSession(model.getAbsolutePath(), options);
            try {
                return new SingInference(environment, session);
            } catch (IOException | OrtException | RuntimeException exception) {
                try {
                    session.close();
                } catch (OrtException closeError) {
                    exception.addSuppressed(closeError);
                }
                throw exception;
            }
        }
    }

    synchronized void separate(float[] stereoPcm, float[] vocals) throws IOException, OrtException {
        if (closed) {
            throw new IllegalStateException("Vocal separation session is closed");
        }
        spectrum.forward(stereoPcm, features);
        inputBuffer.position(0);
        inputBuffer.put(features);
        try (OrtSession.Result result = session.run(inputs, outputs)) {
            if (result.size() != 1) {
                throw new IOException("Unexpected vocal model output");
            }
            outputBuffer.position(0);
            outputBuffer.get(features);
        }
        spectrum.inverse(features, vocals);
        for (float sample : vocals) {
            if (Float.isNaN(sample) || Float.isInfinite(sample)) {
                throw new IOException("Vocal model produced a non-finite sample");
            }
        }
    }

    @Override
    public synchronized void close() {
        if (closed) return;
        closed = true;
        output.close();
        input.close();
        try {
            session.close();
        } catch (OrtException exception) {
            Log.w(TAG, "Could not close the vocal separation session", exception);
        }
    }

    private static FloatBuffer allocateTensorBuffer() {
        return ByteBuffer.allocateDirect(MdxSpectrum.TENSOR_SIZE * Float.BYTES)
            .order(ByteOrder.nativeOrder())
            .asFloatBuffer();
    }

    private static String tensorName(Map<String, NodeInfo> tensors) throws IOException {
        if (tensors.size() != 1) {
            throw new IOException("Expected a single tensor in the vocal model");
        }
        Map.Entry<String, NodeInfo> entry = tensors.entrySet().iterator().next();
        if (!(entry.getValue().getInfo() instanceof TensorInfo info) || info.type != OnnxJavaType.FLOAT) {
            throw new IOException("Expected a float tensor in the vocal model");
        }
        long[] actualShape = info.getShape();
        if (actualShape.length != SHAPE.length) {
            throw new IOException("Unexpected vocal model tensor rank");
        }
        for (int axis = 0; axis < SHAPE.length; axis++) {
            if (axis == 0 && actualShape[axis] == -1) continue;
            if (actualShape[axis] != SHAPE[axis]) {
                throw new IOException("Unexpected vocal model tensor shape");
            }
        }
        return entry.getKey();
    }

    private static File getVerifiedModel(Context context) throws IOException, NoSuchAlgorithmException {
        File directory = new File(context.getNoBackupFilesDir(), "voidhack-sing");
        if (!directory.isDirectory() && !directory.mkdirs() && !directory.isDirectory()) {
            throw new IOException("Could not create vocal model directory");
        }
        File model = new File(directory, MODEL_NAME);
        if (model.length() == MODEL_BYTES) {
            try (InputStream input = new FileInputStream(model)) {
                if (verifyModel(input, null)) return model;
            } catch (InterruptedIOException exception) {
                throw exception;
            } catch (IOException exception) {
                Log.w(TAG, "Could not read the cached vocal model", exception);
            }
        }

        File temporary = File.createTempFile("model-", ".download", directory);
        try {
            downloadModel(temporary);
            if (!temporary.renameTo(model)) {
                throw new IOException("Could not install the vocal model");
            }
            return model;
        } finally {
            if (temporary.exists() && !temporary.delete()) {
                Log.w(TAG, "Could not remove the temporary vocal model");
            }
        }
    }

    private static void downloadModel(File temporary) throws IOException, NoSuchAlgorithmException {
        URL url = new URL(MODEL_URL);
        for (int redirects = 0; redirects <= MAX_REDIRECTS; redirects++) {
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setConnectTimeout(15_000);
            connection.setReadTimeout(30_000);
            connection.setInstanceFollowRedirects(false);
            connection.setRequestProperty("Accept-Encoding", "identity");
            try {
                int response = connection.getResponseCode();
                if (response == HttpsURLConnection.HTTP_OK) {
                    try (InputStream input = connection.getInputStream();
                         FileOutputStream output = new FileOutputStream(temporary)) {
                        if (!verifyModel(input, output)) {
                            throw new IOException("Vocal model failed size or SHA-256 verification");
                        }
                        output.getFD().sync();
                        return;
                    }
                }
                if (response != 301 && response != 302 && response != 303 && response != 307 && response != 308) {
                    throw new IOException("Vocal model download failed with HTTP " + response);
                }
                String location = connection.getHeaderField("Location");
                if (location == null) throw new IOException("Missing vocal model redirect location");
                url = new URL(url, location);
                String host = url.getHost();
                if (!"https".equals(url.getProtocol()) || url.getUserInfo() != null
                    || !(host.equals("huggingface.co") || host.endsWith(".hf.co"))) {
                    throw new IOException("Unexpected vocal model redirect");
                }
            } finally {
                connection.disconnect();
            }
        }
        throw new IOException("Too many vocal model redirects");
    }

    private static boolean verifyModel(InputStream input, FileOutputStream copy)
        throws IOException, NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] buffer = new byte[64 * 1024];
        int bytes = 0;
        int count;
        while ((count = input.read(buffer)) != -1) {
            if (Thread.currentThread().isInterrupted()) {
                throw new InterruptedIOException("Vocal model preparation was interrupted");
            }
            bytes += count;
            if (bytes > MODEL_BYTES) return false;
            digest.update(buffer, 0, count);
            if (copy != null) copy.write(buffer, 0, count);
        }
        StringBuilder hex = new StringBuilder(64);
        for (byte value : digest.digest()) {
            hex.append(Character.forDigit((value & 0xff) >>> 4, 16));
            hex.append(Character.forDigit(value & 0x0f, 16));
        }
        return bytes == MODEL_BYTES && MODEL_SHA256.contentEquals(hex);
    }
}
