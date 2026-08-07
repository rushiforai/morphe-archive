.class public final synthetic Ll/lqd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/b7h0;


# instance fields
.field public final synthetic a:Ljava/lang/Class;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Class;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lqd;->a:Ljava/lang/Class;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lqd;->a:Ljava/lang/Class;

    invoke-static {p0}, Lcom/google/android/exoplayer2/source/d$a;->e(Ljava/lang/Class;)Lcom/google/android/exoplayer2/source/i$a;

    move-result-object p0

    return-object p0
.end method
