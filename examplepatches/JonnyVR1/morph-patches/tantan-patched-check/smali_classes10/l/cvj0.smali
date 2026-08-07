.class public final synthetic Ll/cvj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/jvj0;


# direct methods
.method public synthetic constructor <init>(Ll/jvj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cvj0;->a:Ll/jvj0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cvj0;->a:Ll/jvj0;

    check-cast p1, Ll/qvj0;

    invoke-static {p0, p1}, Ll/jvj0;->Y3(Ll/jvj0;Ll/qvj0;)Ll/pvj0;

    move-result-object p0

    return-object p0
.end method
