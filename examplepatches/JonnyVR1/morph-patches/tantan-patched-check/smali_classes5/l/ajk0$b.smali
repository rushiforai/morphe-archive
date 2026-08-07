.class public Ll/ajk0$b;
.super Ll/zpq;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ajk0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic f:Ll/ajk0;


# direct methods
.method public constructor <init>(Ll/ajk0;Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/putong/app/web/WebViewX;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ajk0$b;->f:Ll/ajk0;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3, p4}, Ll/zpq;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/putong/app/web/WebViewX;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public pickPicture()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ajk0$b;->f:Ll/ajk0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/sup0;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x1

    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, v0, v1, v1, v0}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
