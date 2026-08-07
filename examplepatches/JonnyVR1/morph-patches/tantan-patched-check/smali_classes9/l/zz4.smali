.class public final synthetic Ll/zz4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/f05;


# direct methods
.method public synthetic constructor <init>(Ll/f05;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zz4;->a:Ll/f05;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zz4;->a:Ll/f05;

    check-cast p1, Ll/vf3$c;

    invoke-static {p0, p1}, Ll/f05;->L3(Ll/f05;Ll/vf3$c;)Ll/g4$a;

    move-result-object p0

    return-object p0
.end method
