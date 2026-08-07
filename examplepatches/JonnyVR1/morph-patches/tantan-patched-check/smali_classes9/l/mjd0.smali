.class public final synthetic Ll/mjd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ojd0;


# direct methods
.method public synthetic constructor <init>(Ll/ojd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mjd0;->a:Ll/ojd0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mjd0;->a:Ll/ojd0;

    check-cast p1, Ll/x5;

    invoke-static {p0, p1}, Ll/ojd0;->b(Ll/ojd0;Ll/x5;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
