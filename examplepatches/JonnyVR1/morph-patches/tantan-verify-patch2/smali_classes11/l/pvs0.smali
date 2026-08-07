.class public final Ll/pvs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xct0;


# instance fields
.field public final synthetic a:Ll/vus0;

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ll/tct0;

.field public final synthetic d:Ll/aws0;


# direct methods
.method public constructor <init>(Ll/aws0;Ll/vus0;Ljava/lang/Object;Ll/tct0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/pvs0;->a:Ll/vus0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/pvs0;->b:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p4, p0, Ll/pvs0;->c:Ll/tct0;

    .line 6
    .line 7
    iput-object p1, p0, Ll/pvs0;->d:Ll/aws0;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final bridge synthetic zza(Ljava/lang/Object;)V
    .locals 3

    .line 1
    check-cast p1, Ll/cvs0;

    .line 2
    .line 3
    const-string v0, "callJs > getEngine: Promise fulfilled"

    .line 4
    .line 5
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/pvs0;->b:Ljava/lang/Object;

    .line 9
    .line 10
    iget-object v1, p0, Ll/pvs0;->c:Ll/tct0;

    .line 11
    .line 12
    iget-object v2, p0, Ll/pvs0;->d:Ll/aws0;

    .line 13
    .line 14
    iget-object p0, p0, Ll/pvs0;->a:Ll/vus0;

    .line 15
    .line 16
    invoke-static {v2, p0, p1, v0, v1}, Ll/aws0;->b(Ll/aws0;Ll/vus0;Ll/cvs0;Ljava/lang/Object;Ll/tct0;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
