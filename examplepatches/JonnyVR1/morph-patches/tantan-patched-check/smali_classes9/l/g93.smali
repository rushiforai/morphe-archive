.class public final synthetic Ll/g93;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/h93;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/h93;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g93;->a:Ll/h93;

    iput p2, p0, Ll/g93;->b:I

    iput p3, p0, Ll/g93;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g93;->a:Ll/h93;

    iget v1, p0, Ll/g93;->b:I

    iget p0, p0, Ll/g93;->c:I

    invoke-static {v0, v1, p0}, Ll/h93;->a(Ll/h93;II)V

    return-void
.end method
