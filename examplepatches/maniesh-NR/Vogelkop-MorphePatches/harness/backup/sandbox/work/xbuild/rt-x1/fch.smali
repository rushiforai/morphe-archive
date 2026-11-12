.class public final Lfch;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lhcb;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, Lfch;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    invoke-virtual {v0}, Ls15;->c()Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lhcb;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfch;->a:Lhcb;

    return-void
.end method
