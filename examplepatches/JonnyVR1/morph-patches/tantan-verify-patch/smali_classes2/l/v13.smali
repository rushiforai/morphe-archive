.class public final synthetic Ll/v13;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/w13;

.field public final synthetic b:Ll/t13;


# direct methods
.method public synthetic constructor <init>(Ll/w13;Ll/t13;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v13;->a:Ll/w13;

    iput-object p2, p0, Ll/v13;->b:Ll/t13;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v13;->a:Ll/w13;

    iget-object p0, p0, Ll/v13;->b:Ll/t13;

    invoke-static {v0, p0}, Ll/w13;->b(Ll/w13;Ll/t13;)Lcom/clevertap/android/sdk/network/DownloadedBitmap;

    move-result-object p0

    return-object p0
.end method
