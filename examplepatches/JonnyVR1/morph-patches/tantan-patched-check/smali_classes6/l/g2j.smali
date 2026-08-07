.class public final synthetic Ll/g2j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/i2j;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/i2j;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g2j;->a:Ll/i2j;

    iput p2, p0, Ll/g2j;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g2j;->a:Ll/i2j;

    iget p0, p0, Ll/g2j;->b:I

    invoke-static {v0, p0}, Ll/i2j;->d(Ll/i2j;I)V

    return-void
.end method
