.class public final synthetic Ll/uy3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/hz3;

.field public final synthetic b:Ll/y34;


# direct methods
.method public synthetic constructor <init>(Ll/hz3;Ll/y34;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uy3;->a:Ll/hz3;

    iput-object p2, p0, Ll/uy3;->b:Ll/y34;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uy3;->a:Ll/hz3;

    iget-object p0, p0, Ll/uy3;->b:Ll/y34;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Ll/hz3;->N3(Ll/hz3;Ll/y34;Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
