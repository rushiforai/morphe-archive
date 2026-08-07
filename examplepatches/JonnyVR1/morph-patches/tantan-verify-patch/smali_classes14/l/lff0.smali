.class public final synthetic Ll/lff0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/mgf0;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/mgf0;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lff0;->a:Ll/mgf0;

    iput-object p2, p0, Ll/lff0;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lff0;->a:Ll/mgf0;

    iget-object p0, p0, Ll/lff0;->b:Ll/x20;

    invoke-static {v0, p0}, Ll/mgf0;->m(Ll/mgf0;Ll/x20;)V

    return-void
.end method
