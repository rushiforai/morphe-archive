.class public final Lik5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:Llpe;

.field public final c:Lfch;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, Lik5;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    invoke-virtual {v0}, Ls15;->c()Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lumi;Llpe;Lfch;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lik5;->a:Lumi;

    iput-object p2, p0, Lik5;->b:Llpe;

    iput-object p3, p0, Lik5;->c:Lfch;

    return-void
.end method
