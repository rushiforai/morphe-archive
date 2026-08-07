.class public final synthetic Ll/tn10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/eo10;


# direct methods
.method public synthetic constructor <init>(Ll/eo10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tn10;->a:Ll/eo10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tn10;->a:Ll/eo10;

    check-cast p1, Ll/jc10;

    invoke-static {p0, p1}, Ll/eo10;->t4(Ll/eo10;Ll/jc10;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
