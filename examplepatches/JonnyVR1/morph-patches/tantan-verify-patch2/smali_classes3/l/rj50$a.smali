.class public Ll/rj50$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/rj50;->x0(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/p1/mobile/putong/data/OMSDialogInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/rj50;


# direct methods
.method public constructor <init>(Ll/rj50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rj50$a;->a:Ll/rj50;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/OMSDialogInfo;Lcom/p1/mobile/putong/data/OMSDialogInfo;)I
    .locals 0

    .line 1
    iget-object p0, p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/OMSDisplayRule;->priority:I

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->constraint:Lcom/p1/mobile/putong/data/OMSDisplayRule;

    .line 6
    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/data/OMSDisplayRule;->priority:I

    .line 8
    .line 9
    sub-int/2addr p0, p1

    .line 10
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/rj50$a;->a(Lcom/p1/mobile/putong/data/OMSDialogInfo;Lcom/p1/mobile/putong/data/OMSDialogInfo;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
