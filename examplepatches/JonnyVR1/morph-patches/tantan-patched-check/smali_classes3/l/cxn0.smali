.class public final synthetic Ll/cxn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tm50;


# instance fields
.field public final synthetic a:Ll/jxn0;

.field public final synthetic b:Ll/ayn0;


# direct methods
.method public synthetic constructor <init>(Ll/jxn0;Ll/ayn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cxn0;->a:Ll/jxn0;

    iput-object p2, p0, Ll/cxn0;->b:Ll/ayn0;

    return-void
.end method


# virtual methods
.method public final a(Ll/mvc0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cxn0;->a:Ll/jxn0;

    iget-object p0, p0, Ll/cxn0;->b:Ll/ayn0;

    invoke-static {v0, p0, p1}, Ll/jxn0;->d(Ll/jxn0;Ll/ayn0;Ll/mvc0;)V

    return-void
.end method
