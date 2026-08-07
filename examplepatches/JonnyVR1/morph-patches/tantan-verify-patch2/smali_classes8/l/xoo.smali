.class public final synthetic Ll/xoo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/apo;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/apo;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xoo;->a:Ll/apo;

    iput p2, p0, Ll/xoo;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xoo;->a:Ll/apo;

    iget p0, p0, Ll/xoo;->b:I

    check-cast p1, Ll/pf60;

    invoke-static {v0, p0, p1}, Ll/apo;->I0(Ll/apo;ILl/pf60;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
