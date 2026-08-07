.class public final synthetic Ll/w7f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/b7h0;


# instance fields
.field public final synthetic a:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w7f;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w7f;->a:Landroid/content/Context;

    invoke-static {p0}, Lcom/google/android/exoplayer2/ExoPlayer$c;->a(Landroid/content/Context;)Ll/lzc0;

    move-result-object p0

    return-object p0
.end method
