.class public final synthetic Ll/gis;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/bjs;


# direct methods
.method public synthetic constructor <init>(Ll/bjs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gis;->a:Ll/bjs;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gis;->a:Ll/bjs;

    check-cast p1, Ll/xxj;

    invoke-static {p0, p1}, Ll/bjs;->X3(Ll/bjs;Ll/xxj;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
