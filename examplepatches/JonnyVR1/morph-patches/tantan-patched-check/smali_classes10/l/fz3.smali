.class public final synthetic Ll/fz3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/y34;


# direct methods
.method public synthetic constructor <init>(Ll/y34;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fz3;->a:Ll/y34;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fz3;->a:Ll/y34;

    check-cast p1, Ll/y34;

    invoke-static {p0, p1}, Ll/hz3;->L3(Ll/y34;Ll/y34;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
