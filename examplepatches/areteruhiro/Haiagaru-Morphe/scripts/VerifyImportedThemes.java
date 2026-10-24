import app.morphe.extension.chmate.ImportedThemes;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

/** Destructive cases operate exclusively in a newly created local temporary fixture. */
public final class VerifyImportedThemes {
    static int checks;
    static void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
    static ImportedThemes.Entry find(List<ImportedThemes.Entry> entries,String path){
        for(ImportedThemes.Entry entry:entries)if(entry.relativePath.equals(path))return entry;
        throw new AssertionError("Missing "+path);
    }
    public static void main(String[] args)throws Exception{
        Path fixture=Files.createTempDirectory("haiagaru-theme-management-test-");
        try{
            File root=fixture.resolve("theme").toFile();
            check(ImportedThemes.list(root).isEmpty(),"missing directory is empty");
            check(!root.exists(),"listing does not create directories");
            Files.createDirectories(root.toPath().resolve("素材付き/images"));
            Files.write(root.toPath().resolve("Root.day.txt"),new byte[]{1});
            Files.write(root.toPath().resolve("素材付き/夜.night.txt"),new byte[]{2});
            Files.write(root.toPath().resolve("素材付き/昼.day.txt"),new byte[]{3});
            Path image=root.toPath().resolve("素材付き/images/shared.png");Files.write(image,new byte[]{4});
            Path other=root.toPath().resolve("素材付き/readme.txt");Files.write(other,new byte[]{5});
            Files.write(root.toPath().resolve("素材付き/images/deep.day.txt"),new byte[]{6});
            Files.createDirectories(root.toPath().resolve(".import-staging"));
            Files.write(root.toPath().resolve(".import-staging/Hidden.day.txt"),new byte[]{7});
            List<ImportedThemes.Entry> entries=ImportedThemes.list(root);
            check(entries.size()==3,"only supported theme files and one directory level");
            check(entries.get(0).relativePath.equals("Root.day.txt"),"deterministic path order");
            ImportedThemes.Entry night=find(entries,"素材付き/夜.night.txt");
            ImportedThemes.delete(root,night);
            check(!root.toPath().resolve(night.relativePath).toFile().exists(),"selected file deleted");
            check(Files.exists(image)&&Files.exists(other),"assets and unrelated files retained");
            check(Files.exists(root.toPath().resolve("素材付き/昼.day.txt")),"sibling theme retained");
            check(ImportedThemes.list(root).size()==2,"updated list after deletion");
            boolean missing=false;try{ImportedThemes.delete(root,night);}catch(IOException expected){missing=true;}
            check(missing,"already removed entry rejected");
            ImportedThemes.Entry day=find(entries,"素材付き/昼.day.txt");
            Files.write(root.toPath().resolve(day.relativePath),new byte[]{8,9});
            boolean changed=false;try{ImportedThemes.delete(root,day);}catch(IOException expected){changed=true;}
            check(changed&&Files.size(root.toPath().resolve(day.relativePath))==2,"replacement protected while confirmation open");
            boolean nullEntry=false;try{ImportedThemes.delete(root,null);}catch(IOException expected){nullEntry=true;}
            check(nullEntry,"no selection rejected");
            File wrong=fixture.resolve("other-root").toFile();
            boolean wrongRoot=false;try{ImportedThemes.delete(wrong,find(entries,"Root.day.txt"));}catch(IOException expected){wrongRoot=true;}
            check(wrongRoot&&Files.exists(root.toPath().resolve("Root.day.txt")),"different directory cannot delete listed file");
            System.out.println("PASS "+checks+" imported-theme management checks");
        }finally{
            try(java.util.stream.Stream<Path> paths=Files.walk(fixture)){
                for(Path path:paths.sorted(java.util.Comparator.reverseOrder()).toArray(Path[]::new))Files.delete(path);
            }
        }
    }
}
