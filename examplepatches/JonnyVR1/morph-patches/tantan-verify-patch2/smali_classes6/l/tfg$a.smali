.class public Ll/tfg$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tfg;->C(Ll/ufg;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/tfg;


# direct methods
.method public constructor <init>(Ll/tfg;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/tfg$a;->b:Ll/tfg;

    .line 2
    .line 3
    iput p2, p0, Ll/tfg$a;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/tfg$a;->b:Ll/tfg;

    .line 2
    .line 3
    invoke-static {p1}, Ll/tfg;->y(Ll/tfg;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->H:I

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Ll/tfg$a;->b:Ll/tfg;

    .line 16
    .line 17
    invoke-static {p1}, Ll/tfg;->A(Ll/tfg;)Ll/ntl;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Ll/tfg$a;->b:Ll/tfg;

    .line 24
    .line 25
    invoke-static {p1}, Ll/tfg;->A(Ll/tfg;)Ll/ntl;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object v0, p0, Ll/tfg$a;->b:Ll/tfg;

    .line 30
    .line 31
    invoke-static {v0}, Ll/tfg;->z(Ll/tfg;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget p0, p0, Ll/tfg$a;->a:I

    .line 36
    .line 37
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->getId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    const-wide v2, 0x38d7ea4c68000L

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    add-long/2addr v0, v2

    .line 57
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-interface {p1, p0}, Ll/ntl;->d(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void
.end method
