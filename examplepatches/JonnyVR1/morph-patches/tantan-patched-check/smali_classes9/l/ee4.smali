.class public final synthetic Ll/ee4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ue4;


# direct methods
.method public synthetic constructor <init>(Ll/ue4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ee4;->a:Ll/ue4;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ee4;->a:Ll/ue4;

    check-cast p1, Ll/df4;

    invoke-virtual {p0, p1}, Ll/ue4;->m4(Ll/xsl;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
