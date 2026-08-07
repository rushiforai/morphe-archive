.class public final synthetic Ll/jqd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/b7h0;


# instance fields
.field public final synthetic a:Ljava/lang/Class;

.field public final synthetic b:Ll/g6c$a;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Class;Ll/g6c$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jqd;->a:Ljava/lang/Class;

    iput-object p2, p0, Ll/jqd;->b:Ll/g6c$a;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jqd;->a:Ljava/lang/Class;

    iget-object p0, p0, Ll/jqd;->b:Ll/g6c$a;

    invoke-static {v0, p0}, Lcom/google/android/exoplayer2/source/d$a;->a(Ljava/lang/Class;Ll/g6c$a;)Lcom/google/android/exoplayer2/source/i$a;

    move-result-object p0

    return-object p0
.end method
