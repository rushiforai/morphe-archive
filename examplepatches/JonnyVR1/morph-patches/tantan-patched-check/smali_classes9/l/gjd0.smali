.class public final synthetic Ll/gjd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ljd0;


# direct methods
.method public synthetic constructor <init>(Ll/ljd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gjd0;->a:Ll/ljd0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gjd0;->a:Ll/ljd0;

    check-cast p1, Ll/hmd0;

    invoke-static {p0, p1}, Ll/ljd0;->v4(Ll/ljd0;Ll/hmd0;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
