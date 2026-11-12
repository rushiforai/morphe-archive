package app.morphe.extension.chmate;

import java.io.IOException;

/** Fixed public messages, never URLs, credentials, local paths or raw server error bodies. */
final class VideoThumbnailFailure extends IOException {
    static final int NETWORK=1,DNS=2,TIMEOUT=3,LIMIT=4,HTTP=5,RANGE=6,DECODE=7,STOPPED=8,MEMORY=9,STORAGE=10;
    final int kind, value;
    VideoThumbnailFailure(int kind){this(kind,0);}
    VideoThumbnailFailure(int kind,int value){super("Video thumbnail failure: "+kind+"/"+value);this.kind=kind;this.value=value;}
    static VideoThumbnailFailure from(Throwable error){
        for(Throwable cause=error;cause!=null;cause=cause.getCause()){
            if(cause instanceof VideoThumbnailFailure)return (VideoThumbnailFailure)cause;
            if(cause instanceof java.net.UnknownHostException)return new VideoThumbnailFailure(DNS);
            if(cause instanceof java.net.SocketTimeoutException)return new VideoThumbnailFailure(TIMEOUT);
            if(cause instanceof java.io.FileNotFoundException)return new VideoThumbnailFailure(STORAGE);
            if(cause instanceof java.io.EOFException)return new VideoThumbnailFailure(RANGE);
            if(cause instanceof OutOfMemoryError)return new VideoThumbnailFailure(MEMORY);
        }
        return new VideoThumbnailFailure(error instanceof IOException?NETWORK:DECODE);
    }
    String label(){switch(kind){
        case DNS:return "接続先が見つかりません";
        case NETWORK:return "通信に失敗しました";
        case TIMEOUT:return "取得がタイムアウトしました";
        case LIMIT:return "取得上限を超えました";
        case HTTP:return "サーバーエラー（HTTP "+value+"）";
        case RANGE:return "必要な範囲を取得できません";
        case STOPPED:return "動画の解析を一時停止しています";
        case MEMORY:return "メモリが不足しています";
        case STORAGE:return "画像を保存できません";
        default:return "映像を解析できません";
    }}
    String hint(){switch(kind){
        case DNS:case NETWORK:return "通信・VPN・DNSを確認してください";
        case TIMEOUT:return "通信または取得時間の設定を確認";
        case LIMIT:return "サムネイルの取得上限を確認";
        case HTTP:return "公開状態やアクセス制限を確認";
        case RANGE:return "サーバーの部分取得に失敗しました";
        case STOPPED:return "再取得で解析をやり直せます";
        case MEMORY:return "他のアプリを閉じて再試行";
        case STORAGE:return "端末の空き容量を確認してください";
        default:return "動画形式・破損・端末側の制限を確認";
    }}
}
