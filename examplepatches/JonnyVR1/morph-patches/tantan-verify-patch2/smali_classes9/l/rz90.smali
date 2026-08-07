.class public final synthetic Ll/rz90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/Class;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Class;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rz90;->a:Ljava/lang/Class;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rz90;->a:Ljava/lang/Class;

    check-cast p1, Ll/on2;

    invoke-static {p0, p1}, Ll/sz90;->b(Ljava/lang/Class;Ll/on2;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
