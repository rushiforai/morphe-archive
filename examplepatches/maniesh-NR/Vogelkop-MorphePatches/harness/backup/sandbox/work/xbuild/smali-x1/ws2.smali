.class public final Lws2;
.super Ldt1;
.source "SourceFile"


# instance fields
.field public final e:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final f:I


# direct methods
.method public constructor <init>(Lbt2;Lcom/opera/android/browser/chromium/ChromiumContent;I)V
    .registers 5

    invoke-direct {p0}, Ldt1;-><init>()V

    iput-object p2, p0, Lws2;->e:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput p3, p0, Lws2;->f:I

    new-instance p2, Lxj;

    const/16 p3, 0xe

    invoke-direct {p2, p0, p1, p3}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Lva2;

    const/16 p3, 0x8

    invoke-direct {p1, p0, p3}, Lva2;-><init>(Ljava/lang/Object;B)V

    new-instance p3, La3j;

    const/4 v0, 0x4

    invoke-direct {p3, v0}, La3j;-><init>(B)V

    const-class v0, Lru2;

    invoke-virtual {p0, v0, p2, p1, p3}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    return-void
.end method
