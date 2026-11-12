.class public final Laxa;
.super Lywa;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Laxa;",
        "Lywa;",
        "<init>",
        "()V",
        "image-editor"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic i:I


# instance fields
.field public final h:Lw6j;


# direct methods
.method public constructor <init>()V
    .registers 6

    invoke-direct {p0}, Lywa;-><init>()V

    new-instance v0, Lal7;

    const/16 v1, 0x18

    invoke-direct {v0, p0, v1}, Lal7;-><init>(Ljava/lang/Object;B)V

    const-class v1, Llxa;

    invoke-static {v1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v1

    new-instance v2, Lzwa;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lzwa;-><init>(Laxa;B)V

    new-instance v3, Lzwa;

    const/4 v4, 0x1

    invoke-direct {v3, p0, v4}, Lzwa;-><init>(Laxa;B)V

    new-instance v4, Lw6j;

    invoke-direct {v4, v1, v2, v0, v3}, Lw6j;-><init>(Ls15;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    iput-object v4, p0, Laxa;->h:Lw6j;

    return-void
.end method


# virtual methods
.method public final f0()Llxa;
    .registers 1

    iget-object p0, p0, Laxa;->h:Lw6j;

    invoke-virtual {p0}, Lw6j;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llxa;

    return-object p0
.end method
