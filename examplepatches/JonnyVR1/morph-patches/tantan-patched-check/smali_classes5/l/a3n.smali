.class public final synthetic Ll/a3n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/b3n;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/b3n;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a3n;->a:Ll/b3n;

    iput p2, p0, Ll/a3n;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a3n;->a:Ll/b3n;

    iget p0, p0, Ll/a3n;->b:I

    invoke-static {v0, p0}, Ll/b3n;->c(Ll/b3n;I)V

    return-void
.end method
