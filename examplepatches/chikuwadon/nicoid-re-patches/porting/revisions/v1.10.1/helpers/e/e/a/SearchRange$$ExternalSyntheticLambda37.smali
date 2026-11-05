.class public final synthetic Le/e/a/SearchRange$$ExternalSyntheticLambda37;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/app/DatePickerDialog$OnDateSetListener;


# instance fields
.field public final synthetic f$0:J

.field public final synthetic f$1:Ljava/util/function/LongConsumer;


# direct methods
.method public synthetic constructor <init>(JLjava/util/function/LongConsumer;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda37;->f$0:J

    iput-object p3, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda37;->f$1:Ljava/util/function/LongConsumer;

    return-void
.end method


# virtual methods
.method public final onDateSet(Landroid/widget/DatePicker;III)V
    .registers 12

    .line 0
    iget-wide v0, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda37;->f$0:J

    iget-object v2, p0, Le/e/a/SearchRange$$ExternalSyntheticLambda37;->f$1:Ljava/util/function/LongConsumer;

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-static/range {v0 .. v6}, Le/e/a/SearchRange;->lambda$2(JLjava/util/function/LongConsumer;Landroid/widget/DatePicker;III)V

    return-void
.end method
