package app.bitchord.telegram;

import org.drinkless.tdlib.TdApi;

final class TestMessages {
    static TdApi.Message audio(long chat, long id, String title) {
        TdApi.File file = new TdApi.File();
        file.id = 7;
        file.size = 5L * 1024 * 1024 + 31;
        TdApi.Audio audio = new TdApi.Audio();
        audio.audio = file;
        audio.title = title;
        audio.performer = "Artist";
        audio.fileName = title + ".flac";
        audio.mimeType = "audio/flac";
        audio.duration = 300;
        TdApi.MessageAudio content = new TdApi.MessageAudio();
        content.audio = audio;
        TdApi.Message m = new TdApi.Message();
        m.chatId = chat;
        m.id = id;
        m.content = content;
        m.canBeSaved = true;
        return m;
    }

    static TdApi.Message document(long chat, long id, String name) {
        TdApi.File file = new TdApi.File();
        file.id = 7;
        file.size = 1000;
        TdApi.Document doc = new TdApi.Document();
        doc.fileName = name;
        doc.mimeType = "application/octet-stream";
        doc.document = file;
        TdApi.MessageDocument content = new TdApi.MessageDocument();
        content.document = doc;
        TdApi.Message m = new TdApi.Message();
        m.chatId = chat;
        m.id = id;
        m.content = content;
        m.canBeSaved = true;
        return m;
    }
}
