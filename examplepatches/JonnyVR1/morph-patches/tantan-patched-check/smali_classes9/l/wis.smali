.class public final synthetic Ll/wis;
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

    iput-object p1, p0, Ll/wis;->a:Ll/bjs;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wis;->a:Ll/bjs;

    check-cast p1, Ll/vf3$d;

    invoke-static {p0, p1}, Ll/bjs;->Y3(Ll/bjs;Ll/vf3$d;)Ll/g4$a;

    move-result-object p0

    return-object p0
.end method
