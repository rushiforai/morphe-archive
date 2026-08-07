.class public final synthetic Ll/wb3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/gc3;


# direct methods
.method public synthetic constructor <init>(Ll/gc3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wb3;->a:Ll/gc3;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wb3;->a:Ll/gc3;

    check-cast p1, Ll/vf3$b;

    invoke-static {p0, p1}, Ll/gc3;->K3(Ll/gc3;Ll/vf3$b;)Ll/g4$a;

    move-result-object p0

    return-object p0
.end method
