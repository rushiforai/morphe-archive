.class public final synthetic Ll/tuw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/vuw;


# direct methods
.method public synthetic constructor <init>(Ll/vuw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tuw;->a:Ll/vuw;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tuw;->a:Ll/vuw;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/vuw;->N3(Ll/vuw;Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
