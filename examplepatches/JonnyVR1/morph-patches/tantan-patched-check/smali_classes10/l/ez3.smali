.class public final synthetic Ll/ez3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/Long;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ez3;->a:Ljava/lang/Long;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ez3;->a:Ljava/lang/Long;

    check-cast p1, Ll/y34;

    invoke-static {p0, p1}, Ll/hz3;->O3(Ljava/lang/Long;Ll/y34;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
