.class public final synthetic Ll/mgi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/ngi0;

.field public final synthetic b:Ll/xc00;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ngi0;Ll/xc00;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mgi0;->a:Ll/ngi0;

    iput-object p2, p0, Ll/mgi0;->b:Ll/xc00;

    iput-object p3, p0, Ll/mgi0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mgi0;->a:Ll/ngi0;

    iget-object v1, p0, Ll/mgi0;->b:Ll/xc00;

    iget-object p0, p0, Ll/mgi0;->c:Ljava/lang/String;

    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/String;

    invoke-static {v0, v1, p0, p1, p2}, Ll/ngi0;->L(Ll/ngi0;Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
