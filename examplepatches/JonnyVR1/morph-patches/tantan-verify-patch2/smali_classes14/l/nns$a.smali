.class public Ll/nns$a;
.super Ll/x8e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nns;->d3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/nns;


# direct methods
.method public constructor <init>(Ll/nns;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nns$a;->a:Ll/nns;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/x8e;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/io/File;)V
    .locals 0
    .param p1    # Ljava/io/File;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/x8e;->a(Ljava/io/File;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFailed(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method
