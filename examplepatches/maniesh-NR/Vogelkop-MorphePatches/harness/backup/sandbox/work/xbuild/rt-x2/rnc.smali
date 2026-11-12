.class public final Lrnc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lsnc;

.field public final synthetic b:Lumi;


# direct methods
.method public constructor <init>(Lsnc;Lumi;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrnc;->a:Lsnc;

    iput-object p2, p0, Lrnc;->b:Lumi;

    return-void
.end method


# virtual methods
.method public final a(Lndc;)Ltn;
    .registers 5

    new-instance v0, Ltn;

    iget-object v1, p0, Lrnc;->a:Lsnc;

    iget-object v2, v1, Lsnc;->g:Lxnc;

    iget-object v2, v2, Lxnc;->b:Lkze;

    iget-object v1, v1, Lsnc;->n:Lt1;

    iget-object p0, p0, Lrnc;->b:Lumi;

    invoke-direct {v0, v2, v1, p0, p1}, Ltn;-><init>(Lkze;Lt1;Lumi;Lndc;)V

    return-object v0
.end method
