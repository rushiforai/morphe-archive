.class public final synthetic Ll/zmc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/t26;


# direct methods
.method public synthetic constructor <init>(Ll/t26;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zmc0;->a:Ll/t26;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zmc0;->a:Ll/t26;

    check-cast p1, Ll/enc0;

    invoke-static {p0, p1}, Ll/enc0;->o(Ll/t26;Ll/enc0;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
