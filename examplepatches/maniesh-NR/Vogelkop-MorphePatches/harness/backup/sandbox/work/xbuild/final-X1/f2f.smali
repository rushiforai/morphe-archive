.class public final Lf2f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:Lg2f;


# direct methods
.method public constructor <init>(Lnrl;Ljava/lang/String;IILg2f;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lf2f;->a:Ljava/lang/String;

    iput p3, p0, Lf2f;->b:I

    iput p4, p0, Lf2f;->c:I

    iput-object p5, p0, Lf2f;->d:Lg2f;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    const/16 v4, 0xa

    iget-object v5, p0, Lf2f;->d:Lg2f;

    iget-object v0, p0, Lf2f;->a:Ljava/lang/String;

    iget v1, p0, Lf2f;->b:I

    iget v2, p0, Lf2f;->c:I

    const/16 v3, 0xc00

    invoke-static/range {v0 .. v5}, Loya;->b(Ljava/lang/String;IIIILmya;)Lnya;

    return-void
.end method
