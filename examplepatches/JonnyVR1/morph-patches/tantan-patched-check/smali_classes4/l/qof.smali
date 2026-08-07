.class public final synthetic Ll/qof;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/rof;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/rof;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qof;->a:Ll/rof;

    iput-object p2, p0, Ll/qof;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qof;->a:Ll/rof;

    iget-object p0, p0, Ll/qof;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/rof;->a(Ll/rof;Ljava/lang/String;)V

    return-void
.end method
