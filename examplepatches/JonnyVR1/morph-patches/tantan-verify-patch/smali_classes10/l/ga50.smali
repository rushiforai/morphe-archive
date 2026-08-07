.class public final synthetic Ll/ga50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ta50;


# direct methods
.method public synthetic constructor <init>(Ll/ta50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ga50;->a:Ll/ta50;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ga50;->a:Ll/ta50;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/ta50;->O3(Ll/ta50;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
