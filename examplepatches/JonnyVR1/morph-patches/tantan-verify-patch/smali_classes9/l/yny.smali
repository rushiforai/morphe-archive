.class public final synthetic Ll/yny;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/boy;


# direct methods
.method public synthetic constructor <init>(Ll/boy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yny;->a:Ll/boy;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yny;->a:Ll/boy;

    check-cast p1, Ll/hcr;

    invoke-static {p0, p1}, Ll/boy;->X3(Ll/boy;Ll/hcr;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method
