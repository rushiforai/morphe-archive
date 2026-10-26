package app.morphe.extension.chmate;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;
import java.util.HashMap;
import java.util.Map;

/** Resolve tracked documents through the selected folder, including plain document URIs. */
final class LocalBackupDocuments implements LocalBackupRetention.Documents {
    private final Context context;
    private final Uri tree;
    private final Map<String,String> children=new HashMap<>();
    private boolean listed;

    LocalBackupDocuments(Context context,Uri tree) {
        this.context=context;this.tree=tree;
        try {
            Uri listing=DocumentsContract.buildChildDocumentsUriUsingTree(tree,DocumentsContract.getTreeDocumentId(tree));
            try(Cursor cursor=context.getContentResolver().query(listing,new String[]{
                    DocumentsContract.Document.COLUMN_DOCUMENT_ID,DocumentsContract.Document.COLUMN_DISPLAY_NAME},null,null,null)) {
                if(cursor==null)return;
                while(cursor.moveToNext())children.put(cursor.getString(0),cursor.getString(1));
                listed=true;
            }
        } catch(Exception unavailable) { android.util.Log.w("Haiagaru","Cannot list automatic backup folder",unavailable); }
    }

    private String id(String value) {
        Uri document=Uri.parse(value);
        if(!"content".equals(document.getScheme())||!tree.getAuthority().equals(document.getAuthority()))return null;
        // createDocument() may return /document/id instead of /tree/id/document/id.
        // The direct-child listing, rather than URI shape or a path prefix, proves membership.
        return DocumentsContract.getDocumentId(document);
    }

    String canonical(String value) {
        try {
            String id=id(value);
            return id==null?value:DocumentsContract.buildDocumentUriUsingTree(tree,id).toString();
        } catch(Exception invalid) { return value; }
    }

    public LocalBackupRetention.Presence inspect(String value) {
        try {
            String id=id(value);
            if(!listed||id==null)return LocalBackupRetention.Presence.UNVERIFIED;
            if(!children.containsKey(id)) {
                // Distinguish a deleted record from a live document moved elsewhere.
                Uri document=DocumentsContract.buildDocumentUriUsingTree(tree,id);
                try(Cursor cursor=context.getContentResolver().query(document,
                        new String[]{DocumentsContract.Document.COLUMN_DOCUMENT_ID},null,null,null)) {
                    return cursor!=null&&!cursor.moveToFirst()?LocalBackupRetention.Presence.MISSING
                            :LocalBackupRetention.Presence.UNVERIFIED;
                } catch(Exception unavailable) {
                    return unavailable instanceof java.io.FileNotFoundException
                            ?LocalBackupRetention.Presence.MISSING:LocalBackupRetention.Presence.UNVERIFIED;
                }
            }
            String name=children.get(id);
            return name!=null&&name.startsWith("haiagaru-auto-")&&name.endsWith(".zip")
                    ?LocalBackupRetention.Presence.OWNED:LocalBackupRetention.Presence.UNVERIFIED;
        } catch(Exception unavailable) { return LocalBackupRetention.Presence.UNVERIFIED; }
    }

    public boolean delete(String value) {
        try {
            if(inspect(value)!=LocalBackupRetention.Presence.OWNED)return false;
            Uri document=DocumentsContract.buildDocumentUriUsingTree(tree,id(value));
            return DocumentsContract.deleteDocument(context.getContentResolver(),document);
        } catch(Exception unavailable) { return false; }
    }
}
