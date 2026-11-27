package app.johninnl.modelhost.api;
import org.json.JSONObject;
/** Explicit caller-supplied text history. No provider-side cross-app conversation collection. */
public final class ChatMessage {
 public final String role,text;
 public ChatMessage(String role,String text){if(!"system".equals(role)&&!"user".equals(role)&&!"assistant".equals(role))throw new IllegalArgumentException("Unsupported message role");if(text==null)throw new IllegalArgumentException("Missing message text");this.role=role;this.text=text;}
 JSONObject toJson(){JSONObject o=new JSONObject();Protocol.put(o,"role",role);Protocol.put(o,"text",text);return o;}
}
