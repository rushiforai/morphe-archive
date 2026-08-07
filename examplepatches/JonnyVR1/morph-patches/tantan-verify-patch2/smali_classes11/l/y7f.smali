.class public final synthetic Ll/y7f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/b7h0;


# instance fields
.field public final synthetic a:Ll/cgj0;


# direct methods
.method public synthetic constructor <init>(Ll/cgj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y7f;->a:Ll/cgj0;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y7f;->a:Ll/cgj0;

    invoke-static {p0}, Lcom/google/android/exoplayer2/ExoPlayer$c;->c(Ll/cgj0;)Ll/cgj0;

    move-result-object p0

    return-object p0
.end method
