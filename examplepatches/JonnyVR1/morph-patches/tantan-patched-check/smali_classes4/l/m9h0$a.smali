.class public final Ll/m9h0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/m9h0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0006\u001a\u00020\u00002\u0008\u0008\u0001\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0015\u0010\t\u001a\u00020\u00002\u0006\u0010\u0008\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\t\u0010\u0007J\u0015\u0010\u000c\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\r\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\u000f\u0010\u0010R\u001c\u0010\u0005\u001a\u00020\u00048\u0002@\u0002X\u0083\u000e\u00a2\u0006\u000c\n\u0004\u0008\u000f\u0010\u0011\u0012\u0004\u0008\u0012\u0010\u0003R\u0016\u0010\u0008\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000c\u0010\u0011R\u0016\u0010\u000b\u001a\u00020\n8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0006\u0010\u0013\u00a8\u0006\u0014"
    }
    d2 = {
        "Ll/m9h0$a;",
        "",
        "<init>",
        "()V",
        "",
        "type",
        "c",
        "(Ljava/lang/String;)Ll/m9h0$a;",
        "tabName",
        "d",
        "Lcom/p1/mobile/android/app/Frag;",
        "frag",
        "b",
        "(Lcom/p1/mobile/android/app/Frag;)Ll/m9h0$a;",
        "Ll/m9h0;",
        "a",
        "()Ll/m9h0;",
        "Ljava/lang/String;",
        "getType$annotations",
        "Lcom/p1/mobile/android/app/Frag;",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public a:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public c:Lcom/p1/mobile/android/app/Frag;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "unknown"

    .line 5
    .line 6
    iput-object v0, p0, Ll/m9h0$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Ll/m9h0$a;->b:Ljava/lang/String;

    .line 9
    .line 10
    new-instance v0, Lcom/p1/mobile/android/app/Frag;

    .line 11
    .line 12
    invoke-direct {v0}, Lcom/p1/mobile/android/app/Frag;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/m9h0$a;->c:Lcom/p1/mobile/android/app/Frag;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final a()Ll/m9h0;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/m9h0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/m9h0$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Ll/m9h0$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Ll/m9h0$a;->c:Lcom/p1/mobile/android/app/Frag;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    invoke-direct {v0, v1, v2, p0, v3}, Ll/m9h0;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Frag;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public final b(Lcom/p1/mobile/android/app/Frag;)Ll/m9h0$a;
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Frag;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/m9h0$a;->c:Lcom/p1/mobile/android/app/Frag;

    .line 5
    .line 6
    return-object p0
.end method

.method public final c(Ljava/lang/String;)Ll/m9h0$a;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/m9h0$a;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-object p0
.end method

.method public final d(Ljava/lang/String;)Ll/m9h0$a;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/m9h0$a;->b:Ljava/lang/String;

    .line 5
    .line 6
    return-object p0
.end method
