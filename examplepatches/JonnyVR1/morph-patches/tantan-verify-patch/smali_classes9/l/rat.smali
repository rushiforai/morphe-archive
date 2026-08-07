.class public final synthetic Ll/rat;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/vat;


# direct methods
.method public synthetic constructor <init>(Ll/vat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rat;->a:Ll/vat;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rat;->a:Ll/vat;

    check-cast p1, Ll/z160;

    invoke-static {p0, p1}, Ll/vat;->R3(Ll/vat;Ll/z160;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method
