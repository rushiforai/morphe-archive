.class public final synthetic Lzs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzvk;


# instance fields
.field public final synthetic a:Lct;


# direct methods
.method public synthetic constructor <init>(Lct;)V
    .registers 2

    iput-object p1, p0, Lzs;->a:Lct;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-object p0, p0, Lzs;->a:Lct;

    invoke-virtual {p0}, Lct;->G0()Lju;

    move-result-object p0

    iget-object v0, p0, Lju;->b:Lrq8;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Loz2;

    const/4 v2, 0x2

    const/4 v3, 0x1

    invoke-direct {v1, v2, v0, v3}, Loz2;-><init>(BLjava/lang/Object;Z)V

    iget-object v2, v0, Lrq8;->c:Llld;

    new-instance v3, Lhu5;

    const/16 v4, 0xa

    invoke-direct {v3, v1, v0, v4}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Llld;->e0(Lcom/opera/api/Callback;)V

    iget-object p0, p0, Lju;->g:Ltr8;

    invoke-virtual {p0}, Ltr8;->a()V

    return-void
.end method
