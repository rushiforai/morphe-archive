.class public final Lcii;
.super Lnji;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lpii;


# direct methods
.method public constructor <init>(Lpii;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcii;->a:Lpii;

    return-void
.end method


# virtual methods
.method public final d()V
    .registers 1

    iget-object p0, p0, Lcii;->a:Lpii;

    invoke-virtual {p0}, Lpii;->G0()V

    return-void
.end method
