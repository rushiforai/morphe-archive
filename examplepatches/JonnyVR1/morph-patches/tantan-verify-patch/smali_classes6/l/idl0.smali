.class public final synthetic Ll/idl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/idl0;->a:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/idl0;->a:Ljava/io/File;

    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->S4(Ljava/io/File;)V

    return-void
.end method
