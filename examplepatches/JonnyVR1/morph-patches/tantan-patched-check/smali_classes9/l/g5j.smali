.class public final synthetic Ll/g5j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/i5j;


# direct methods
.method public synthetic constructor <init>(Ll/i5j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g5j;->a:Ll/i5j;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g5j;->a:Ll/i5j;

    check-cast p1, Ll/bgd0;

    invoke-static {p0, p1}, Ll/i5j;->O3(Ll/i5j;Ll/bgd0;)Ll/agd0;

    move-result-object p0

    return-object p0
.end method
