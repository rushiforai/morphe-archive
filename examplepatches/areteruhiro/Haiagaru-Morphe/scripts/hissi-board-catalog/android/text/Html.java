package android.text;public final class Html {public static CharSequence fromHtml(String text){return text.replaceAll("<[^>]+>","").replace("&amp;","&");}}
