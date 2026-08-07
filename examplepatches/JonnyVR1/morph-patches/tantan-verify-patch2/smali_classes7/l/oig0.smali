.class public final synthetic Ll/oig0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/klg0;

.field public final synthetic c:I

.field public final synthetic d:Ll/bxg0;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/klg0;ILl/bxg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oig0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/oig0;->b:Ll/klg0;

    iput p3, p0, Ll/oig0;->c:I

    iput-object p4, p0, Ll/oig0;->d:Ll/bxg0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/oig0;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/oig0;->b:Ll/klg0;

    iget v2, p0, Ll/oig0;->c:I

    iget-object p0, p0, Ll/oig0;->d:Ll/bxg0;

    invoke-static {v0, v1, v2, p0}, Ll/llg0;->h(Ljava/lang/String;Ll/klg0;ILl/bxg0;)V

    return-void
.end method
