.class public final synthetic Ll/ol60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/xl60;

.field public final synthetic b:Ll/h2m;

.field public final synthetic c:Ll/peb0;


# direct methods
.method public synthetic constructor <init>(Ll/xl60;Ll/h2m;Ll/peb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ol60;->a:Ll/xl60;

    iput-object p2, p0, Ll/ol60;->b:Ll/h2m;

    iput-object p3, p0, Ll/ol60;->c:Ll/peb0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ol60;->a:Ll/xl60;

    iget-object v1, p0, Ll/ol60;->b:Ll/h2m;

    iget-object p0, p0, Ll/ol60;->c:Ll/peb0;

    invoke-static {v0, v1, p0}, Ll/xl60;->b(Ll/xl60;Ll/h2m;Ll/peb0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
